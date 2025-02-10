import AVFoundation

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    static let shared = AudioManager()

    var audioPlayer: AVAudioPlayer?
    @Published var isMuted: Bool = false
    @Published var volume: Float = 0.1 { // Start at half volume
        didSet {
            audioPlayer?.volume = volume
        }
    }

    private var songs = [ "Medieval Vol. 2 5", "Medieval Vol. 2 4"] // Playlist
    private var currentSongIndex = 0

    private override init() { // Override because we're subclassing NSObject
        super.init()
        setupAudioSession()
        playBackgroundMusic()
    }

    func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }

    func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: songs[currentSongIndex], withExtension: "mp3") else {
            print("MP3 file not found in bundle: \(songs[currentSongIndex])")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.volume = volume  // Set initial volume to 0.5
            audioPlayer?.delegate = self  // Delegate to handle track switching
            audioPlayer?.play()
            print("Now playing: \(songs[currentSongIndex])")
        } catch {
            print("Error loading and playing music: \(error)")
        }
    }

    func playNextSong() {
        currentSongIndex = (currentSongIndex + 1) % songs.count // Loop through songs
        playBackgroundMusic()
    }

    func toggleMute() {
        isMuted.toggle()
        audioPlayer?.volume = isMuted ? 0 : volume
    }

    // This function is called when a song finishes playing
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playNextSong() // Play the next song when the current one ends
    }
}

class Pusher < Formula
  desc "FTC Robot deployment tool - automate building and deploying Android apps to robots"
  homepage "https://github.com/andreibanu/pusher"
  url "https://github.com/PzmuV1517/Pusher/archive/v1.0.34.tar.gz"
  sha256 "6714fdd104cd22c64df52e8cd08ec8d5b99c53ebd772ae79aeb28f26c6a6f046"
  version "1.0.34"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      Pusher requires ADB (Android Debug Bridge) to be installed.
      Install it with:
        brew install android-platform-tools

      Run 'pusher help' to get started.
    EOS
  end

  test do
    assert_match "FTC Robot Deployment Tool", shell_output("#{bin}/pusher help")
  end
end

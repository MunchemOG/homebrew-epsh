class Pusher < Formula
  desc "FTC Robot deployment tool - automate building and deploying Android apps to robots"
  homepage "https://github.com/andreibanu/pusher"
  url "https://github.com/PzmuV1517/Pusher/archive/v1.0.52.tar.gz"
  sha256 "42e2485f4f7ffd2271da18cfb9f6e384db39c572d19169e147b8dee5fcd7a849"
  version "1.0.52"

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

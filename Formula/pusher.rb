class Pusher < Formula
  desc "FTC Robot deployment tool - automate building and deploying Android apps to robots"
  homepage "https://github.com/andreibanu/pusher"
  url "https://github.com/PzmuV1517/Pusher/archive/v1.0.36.tar.gz"
  sha256 "640f027914d324ce23938d9461fa01d209a0e904353c2f37ae757db6c27b6b2d"
  version "1.0.36"

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

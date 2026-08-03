class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-arm64"
      sha256 "bff9362967ed958a99d98f585cf85f2e2b57d6fbb32a235d02cb392adc0d1bb8"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-amd64"
      sha256 "62b1a09af453f063ea57e32db2c6fe35f9c0b1e39ccbc452629851b71a4bb0c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-arm64"
      sha256 "557d29a57e408bf825649d1f1577466fb35b9e57eb9cbab25599821eac3d2c93"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-amd64"
      sha256 "91fad93f33d40e1230fe21ddb2cd9217f1fec47189b48d889bbd516878d87672"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    source = "aura-#{os}-#{arch}"

    chmod 0755, source
    bin.install source => "aura"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aura --version")
  end
end

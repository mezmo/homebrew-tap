class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-darwin-arm64"
      sha256 "9338bff29d0376ebab3ba1e16cd6c709a564313562633a3278c9b6e037ee81a6"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-darwin-amd64"
      sha256 "7871b6662a2e440368f24bec3cecf7aa27ce075b37600d07d55bd389290e3296"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-linux-arm64"
      sha256 "71c0fcad7c70b8001041b16f85ff048b11c1518db3d36764fccf9a98dd0587d7"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-linux-amd64"
      sha256 "99ae0931a54fcc4bed2744a969f1947463234fbad12f2112819cb635bb10f5af"
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

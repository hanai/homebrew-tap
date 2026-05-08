class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.1/agent-helper-macos-arm64.tar.gz"
      sha256 "0315f29d24a91dd7148f688d21dd755d7945208ca6e2035aede6019b79929c2d"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.1/agent-helper-linux-amd64.tar.gz"
      sha256 "4d38a56f6aa119e442af88aae4f2b300d149f5a936b5c997a0e265e65968fbcf"
    else
      odie "agent-helper does not support Linux ARM"
    end
  end

  def install
    bin.install "agent-helper"
  end

  test do
    system "#{bin}/agent-helper", "--help"
  end
end

class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.6/agent-helper-macos-arm64.tar.gz"
      sha256 "23e729d4c72691db18fcfa4e08e650a279d6c19415e17822869437410ebceaaa"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.6/agent-helper-linux-amd64.tar.gz"
      sha256 "8473b60f6c1f597744db64743aca4a49056be85f17243d34d6613770fe77e84e"
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

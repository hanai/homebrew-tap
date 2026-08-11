class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.3-snapshot.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.17/agent-helper-macos-arm64.tar.gz"
      sha256 "d710a626affe3f382d3dee106e0da4fb168b35f6918ae658870d23eb1d362fc8"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.3-snapshot.17/agent-helper-linux-amd64.tar.gz"
      sha256 "e2074d72fb86420b1ffda71a84b0df0e46defc4ea22daf0cd720552187d1e07b"
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

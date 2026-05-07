class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.16/agent-helper-macos-arm64.tar.gz"
      sha256 "b024b3679a415954ef295fe76080976383c1426f699e0d2f7c37ef111de28984"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.16/agent-helper-linux-amd64.tar.gz"
      sha256 "2a15c986cf1ff0bf19abb472b3edfd7f69ea8ffdd711d271e0c5d1758c2dbf67"
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

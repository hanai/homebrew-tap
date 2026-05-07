class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.14/agent-helper-macos-arm64.tar.gz"
      sha256 "80b46aa6b7c17ac784439ad9510677dd09779c9b91586d59acb846982946d057"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.14/agent-helper-linux-amd64.tar.gz"
      sha256 "0362db61ee0477e100634288697f5127ca234c72b0b25c4559a09ad2b49ba19d"
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

class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "0.3.0-snapshot.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.10/agent-helper-macos-arm64.tar.gz"
      sha256 "9b5682d298e0bbf919fbfea7d7fc371925af121d91c48018e9205cbce3200fb5"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v0.3.0-snapshot.10/agent-helper-linux-amd64.tar.gz"
      sha256 "ac84814d6340291c2e381dae7fceb11868b6ef25b69435fcffdbed4a19699478"
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

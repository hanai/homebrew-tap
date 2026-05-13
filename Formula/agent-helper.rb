class AgentHelper < Formula
  desc "Terminal UI for browsing Claude Code JSONL transcripts"
  homepage "https://github.com/hanai/agent-helper"
  version "1.0.1-snapshot.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.4/agent-helper-macos-arm64.tar.gz"
      sha256 "ef77c461ed89889154045044ff970d1eb148aedf793453f00a5aeba997d9941e"
    else
      odie "agent-helper does not support macOS Intel"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hanai/agent-helper-releases/releases/download/v1.0.1-snapshot.4/agent-helper-linux-amd64.tar.gz"
      sha256 "c932d65f7c1ab337bf9c136e80fe76422a41c391aefa923a170cdf5e7269e920"
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

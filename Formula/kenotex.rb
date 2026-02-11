class Kenotex < Formula
  desc "Vim-style TUI note-taking app with smart distribution to Reminders, Calendar, and Notes"
  homepage "https://github.com/kenxcomp/kenotex"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.0.0/kenotex-aarch64-apple-darwin.tar.gz"
      sha256 "5d3cb0719eeb736ee1c9fd8f34b0bdb85611d386ce5f8144daebead20a1eb75e"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.0.0/kenotex-x86_64-apple-darwin.tar.gz"
      sha256 "1ab480277bc5b6ec581fe839713d2572554ec674fe3f39a6c75fccef73d8b009"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.0.0/kenotex-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3206c9510f4d9863ab3a552bec8a207adbc9182256cdea9bc44b795e045bb74e"
    elsif Hardware::CPU.intel?
      url "https://github.com/kenxcomp/kenotex/releases/download/v1.0.0/kenotex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea4e3fd17240c683f54659b981778c20f625af1b820f81f8e429c08b9438faec"
    end
  end

  def install
    bin.install "kenotex"
  end

  test do
    assert_match "kenotex #{version}", shell_output("#{bin}/kenotex --version")
  end
end

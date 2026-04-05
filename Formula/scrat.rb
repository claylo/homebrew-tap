# typed: true
# frozen_string_literal: true

class Scrat < Formula
  desc "Release management tooling focused on sanity retention"
  homepage "https://github.com/claylo/scrat"
  version "0.1.2"
  license "Apache-2.0 OR MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.2/scrat-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 ""
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.2/scrat-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.2/scrat-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.2/scrat-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "bin/scrat"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/scrat.bash" => "scrat"
    zsh_completion.install "share/completions/_scrat"
    fish_completion.install "share/completions/scrat.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/scrat --version-only")
  end
end

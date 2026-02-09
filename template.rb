# typed: true
# frozen_string_literal: true

class __CLASS__ < Formula
  desc "__DESC__"
  homepage "https://github.com/claylo/__NAME__"
  version "0.0.0"
  license "__LICENSE__"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/__NAME__/releases/download/v#{version}/__NAME__-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "placeholder"
    else
      url "https://github.com/claylo/__NAME__/releases/download/v#{version}/__NAME__-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "placeholder"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/__NAME__/releases/download/v#{version}/__NAME__-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "placeholder"
    else
      url "https://github.com/claylo/__NAME__/releases/download/v#{version}/__NAME__-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "placeholder"
    end
  end

  def install
    bin.install "bin/__NAME__"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/__NAME__.bash" => "__NAME__"
    zsh_completion.install "share/completions/___NAME__"
    fish_completion.install "share/completions/__NAME__.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/__NAME__ --version")
  end
end

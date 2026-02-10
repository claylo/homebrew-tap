# typed: true
# frozen_string_literal: true

class BitoLint < Formula
  desc "Quality gate tooling for building-in-the-open artifacts"
  homepage "https://github.com/claylo/bito-lint"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fa2ee8e96b43e4df2bc9fb45335ae3c2e3c5e6ef8b7173aff943389846981097"
    else
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "50c094c46236d06267b51fbd2901ac8313f0855def16e680b1a8423b589b2757"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fbbf9d298a56a4c8edbab9a6786255d38eade9c6c086501f7180d4e9d55204c7"
    else
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "494dc226ffb40b2a0f015bed59931a630d344db271a8aabbe89c5e3c9919de22"
    end
  end

  def install
    bin.install "bin/bito-lint"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/bito-lint.bash" => "bito-lint"
    zsh_completion.install "share/completions/_bito-lint"
    fish_completion.install "share/completions/bito-lint.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/bito-lint info --version-only")
  end
end

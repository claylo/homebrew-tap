# typed: true
# frozen_string_literal: true

class BitoLint < Formula
  desc "Quality gate tooling for building-in-the-open artifacts"
  homepage "https://github.com/claylo/bito-lint"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7f77a86709aabca8c599bc71a0d577a43eebacb246ac74b1de5e2d4849bbfefe"
    else
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f8d03122c4b6851e670822e6698730ead859944181626039a2cce552ed8916f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd3fdaa6f90559bb126f3bca68aac67959f21559251f8b683e4b80ec14898f41"
    else
      url "https://github.com/claylo/bito-lint/releases/download/v#{version}/bito-lint-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99dd43b80048c6b00ba049ad236825902426815183d7ef54b9eff6015c06f049"
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
    assert_match version.to_s, shell_output("#{bin}/bito-lint info --version-only")
  end
end

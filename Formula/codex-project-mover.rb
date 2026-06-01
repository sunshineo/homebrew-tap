class CodexProjectMover < Formula
  desc "Move Codex Desktop project folders and update local metadata"
  homepage "https://github.com/sunshineo/codex-project-mover"
  url "https://github.com/sunshineo/codex-project-mover/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d77e0d1f52945efc3accc8537923d313c352be96a402315ae9a2f4ba0168974c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/sunshineo/homebrew-tap/releases/download/codex-project-mover-1.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4b52bce615559b998b1ac479838f553d14c48dcf9fc07f25f8d1a1b71dda3fdb"
  end

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "codex-project-mover 1.0.0", shell_output("#{bin}/codex-project-mover --version")
    assert_match "Usage: codex-project-mover <COMMAND>", shell_output("#{bin}/codex-project-mover --help")
  end
end

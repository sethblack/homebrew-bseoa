class Bseoa < Formula
  desc "Technical SEO crawler and site audit tool, with an MCP server for Claude and ChatGPT"
  homepage "https://www.blackseoanalyzer.com"
  version "26.11.9"
  license :cannot_represent

  livecheck do
    url "https://github.com/sethblack/black-seo-analyzer/releases/latest"
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/sethblack/black-seo-analyzer/releases/download/v26.11.9/bseoa-macos-universal"
    sha256 "25d7ad91d77f43b56d08c9ddd0c609e1ac0661eaefe4261e307ea6df564d0396"
  end

  on_linux do
    url "https://github.com/sethblack/black-seo-analyzer/releases/download/v26.11.9/bseoa-linux-x64"
    sha256 "4df55926da19a0a7d54f09571384565712f917a0fb2e32e7a191e692427eb097"
  end

  def install
    # The release asset is a bare binary named after its platform.
    bin.install Dir["bseoa-*"].first => "bseoa"
  end

  def caveats
    <<~EOS
      bseoa needs a license key to crawl. Start a free 14-day trial at
        https://www.blackseoanalyzer.com/free-trial
      then store the key once:
        bseoa license store <your-key>

      To use it from Claude Code:
        claude mcp add bseoa -- bseoa mcp

      On Linux the binary needs glibc 2.39 or newer (Ubuntu 24.04, Debian 13 or later).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bseoa --version")
  end
end

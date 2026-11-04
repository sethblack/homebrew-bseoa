class Bseoa < Formula
  desc "Technical SEO crawler and site audit tool, with an MCP server for Claude and ChatGPT"
  homepage "https://www.blackseoanalyzer.com"
  version "26.11.3"
  license :cannot_represent

  livecheck do
    url "https://github.com/sethblack/black-seo-analyzer/releases/latest"
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/sethblack/black-seo-analyzer/releases/download/v26.11.3/bseoa-macos-universal"
    sha256 "0604d0ac0fd511aad56600ce615dd9c86fde01a119abc81037be4418d4c167b2"
  end

  on_linux do
    url "https://github.com/sethblack/black-seo-analyzer/releases/download/v26.11.3/bseoa-linux-x64"
    sha256 "eb8bbd9a06d58986c3282e7081f6fa7cb5f1d582cc492ace66cd66c41d848c0c"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bseoa --version")
  end
end

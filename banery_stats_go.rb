require 'formula'

class BaneryStatsGo < Formula
  homepage "https://github.com/gogolok/banery_stats_go"
  head "https://github.com/gogolok/banery_stats_go.git"
  
  depends_on "go" => :build

  def install
    ENV["GIT_DIR"] = cached_download/".git" if build.head?
    ENV["GOBIN"] = bin
    ENV["GOPATH"] = buildpath
    ENV["GOHOME"] = buildpath

    system "go", "get"
    system "go", "build", "main.go"
    bin.install "main" => "banery_stats_go"
  end
end

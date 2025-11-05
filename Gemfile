source "https://gems.ruby-china.com"

# 核心：使用 GitHub Pages 官方依赖（包含兼容版本的 Jekyll、主题、插件）
gem "github-pages", "~> 228", group: :jekyll_plugins

# 插件声明（仅保留必要的，且放在 :jekyll_plugins 组内）
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"  # RSS 订阅插件（github-pages 兼容）
  gem "jekyll-seo-tag"          # SEO 插件（放在组内更规范）
end

# Windows 环境必要依赖（无需修改）
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Windows 目录监听优化（无需修改）
gem "wdm", "~> 0.1", :platforms => [:mingw, :x64_mingw, :mswin]

# JRuby 兼容配置（无需修改）
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
gem "webrick"
gem "csv"
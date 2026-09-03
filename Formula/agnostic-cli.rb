class AgnosticCli < Formula
  desc "Official Agnostic CLI for backend-mediated local workspace development"
  homepage "https://www.npmjs.com/package/@nsp-labs/agnostic-cli"
  url "https://registry.npmjs.org/@nsp-labs/agnostic-cli/-/agnostic-cli-0.5.0.tgz"
  sha256 "9b9b069881a7892c91fd10e2e4f496101c457fdc12b7c293b79f935d70b04bca"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "agnostic workspace status", shell_output("#{bin}/agnostic help")

    package_json = libexec/"lib/node_modules/@nsp-labs/agnostic-cli/package.json"
    assert_match "\"version\": \"#{version}\"", package_json.read
  end
end

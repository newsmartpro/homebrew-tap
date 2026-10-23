class AgnosticCli < Formula
  desc "Official Agnostic CLI for backend-mediated local workspace development"
  homepage "https://www.npmjs.com/package/@nsp-labs/agnostic-cli"
  url "https://registry.npmjs.org/@nsp-labs/agnostic-cli/-/agnostic-cli-0.18.2.tgz"
  sha256 "6e4fb6824ed704cb5cd78351a0369e073267cc4805c10237a1ebc74080937018"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age-exclude=@nsp-labs/agnostic-sdk"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "agnostic workspace status", shell_output("#{bin}/agnostic --help")

    package_json = libexec/"lib/node_modules/@nsp-labs/agnostic-cli/package.json"
    assert_match "\"version\": \"#{version}\"", package_json.read
  end
end

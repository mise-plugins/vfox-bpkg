--- Installs bpkg by copying bash scripts to bin directory
--- @param ctx table Context provided by vfox
function PLUGIN:PostInstall(ctx)
    local cmd = require("cmd")

    local sdkInfo = ctx.sdkInfo["bpkg"]
    local path = sdkInfo.path
    local version = sdkInfo.version

    -- The tarball extracts to bpkg-{version}/
    local srcDir = path .. "/bpkg-" .. version

    -- Create bin directory
    cmd.exec("mkdir -p '" .. path .. "/bin'")

    -- List of bpkg scripts to install (main script first)
    local scripts = {
        "bpkg",
        "bpkg-env",
        "bpkg-getdeps",
        "bpkg-init",
        "bpkg-install",
        "bpkg-json",
        "bpkg-list",
        "bpkg-package",
        "bpkg-run",
        "bpkg-show",
        "bpkg-source",
        "bpkg-suggest",
        "bpkg-term",
        "bpkg-update",
        "bpkg-utils",
        "bpkg-realpath",
    }

    -- Copy all bpkg scripts to bin directory and make executable
    for _, script in ipairs(scripts) do
        local src = srcDir .. "/" .. script
        local dst = path .. "/bin/" .. script
        -- Copy and make executable in one command
        cmd.exec("cp -f '" .. src .. "' '" .. dst .. "' && chmod +x '" .. dst .. "'")
    end

    -- Verify main bpkg script was installed
    local file = io.open(path .. "/bin/bpkg", "r")
    if file then
        file:close()
    else
        error("Failed to install bpkg - main script not found at " .. path .. "/bin/bpkg")
    end
end

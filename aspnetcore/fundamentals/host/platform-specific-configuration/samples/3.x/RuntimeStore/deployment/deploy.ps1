function AppendToEnvironmentVariable($name, $appendValue)
{
    $value = [Environment]::GetEnvironmentVariable($name)
    if ($value -eq $null) {
      [Environment]::SetEnvironmentVariable($name, $appendValue)
    } else {
      if ($value -notcontains $appendValue) {
        [Environment]::SetEnvironmentVariable($name, $value + ';' + $appendValue)
      }
    }
}

# Append StartupDiagnostics to ASPNETCORE_HOSTINGSTARTUPASSEMBLIES environment variable
AppendToEnvironmentVariable "ASPNETCORE_HOSTINGSTARTUPASSEMBLIES" "StartupDiagnostics"
# Append the hosting startup dependencies path to DOTNET_ADDITIONAL_DEPS
AppendToEnvironmentVariable "DOTNET_ADDITIONAL_DEPS" "$PSScriptRoot\additionalDeps\"
# Append the runtime store path to DOTNET_SHARED_STORE
AppendToEnvironmentVariable "DOTNET_SHARED_STORE" "$PSScriptRoot\store\"

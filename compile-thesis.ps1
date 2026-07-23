param(
    [string]$MainTex = "TESE.tex",
    [string]$ImageName = "tese-latex:local"
)

$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

docker build -t $ImageName -f (Join-Path $projectRoot "docker/latex/Dockerfile") $projectRoot
docker run --rm -v "${projectRoot}:/work" -w /work $ImageName sh /work/docker/latex/compile.sh $MainTex

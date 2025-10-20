# Simple HTTP Server for Static Files
param(
    [int]$Port = 8080,
    [string]$Path = "."
)

# Get the current directory
$currentPath = Get-Location

# Create a simple HTTP listener
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")

try {
    $listener.Start()
    Write-Host "Server started at http://localhost:$Port" -ForegroundColor Green
    Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
    
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        # Get the requested file path
        $requestPath = $request.Url.LocalPath.TrimStart('/')
        if ($requestPath -eq "") {
            $requestPath = "index.html"
        }
        
        $filePath = Join-Path $currentPath $requestPath
        
        # Check if file exists
        if (Test-Path $filePath -PathType Leaf) {
            $content = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $content.Length
            
            # Set content type based on file extension
            $extension = [System.IO.Path]::GetExtension($filePath).ToLower()
            switch ($extension) {
                ".html" { $response.ContentType = "text/html; charset=utf-8" }
                ".css" { $response.ContentType = "text/css" }
                ".js" { $response.ContentType = "application/javascript" }
                ".png" { $response.ContentType = "image/png" }
                ".jpg" { $response.ContentType = "image/jpeg" }
                ".jpeg" { $response.ContentType = "image/jpeg" }
                ".gif" { $response.ContentType = "image/gif" }
                ".ico" { $response.ContentType = "image/x-icon" }
                default { $response.ContentType = "text/plain" }
            }
            
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            # File not found
            $response.StatusCode = 404
            $notFoundContent = [System.Text.Encoding]::UTF8.GetBytes("File not found: $requestPath")
            $response.ContentLength64 = $notFoundContent.Length
            $response.ContentType = "text/plain"
            $response.OutputStream.Write($notFoundContent, 0, $notFoundContent.Length)
        }
        
        $response.Close()
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $listener.Stop()
    Write-Host "Server stopped." -ForegroundColor Yellow
}

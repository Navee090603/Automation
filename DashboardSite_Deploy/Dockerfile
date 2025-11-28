# Use Windows Server Core with IIS + .NET Framework 4.7.2
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.2-windowsservercore-ltsc2019

# Set work directory inside IIS
WORKDIR /inetpub/wwwroot

# Copy published site files
COPY publish/ /inetpub/wwwroot

# IIS listens on port 80
EXPOSE 80

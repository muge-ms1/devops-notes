wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.windows-amd64.zip -OutFile prometheus-2.52.0.windows-amd64.zip


 Expand-Archive prometheus-2.52.0.windows-amd64.zip



 cd prometheus-2.52.0.windows-amd64\prometheus-2.52.0.windows-amd64


  .\prometheus.exe --config.file=prometheus.yml

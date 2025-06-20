{{/*
Return the name of the chart
*/}}
{{- define "fake-review.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the full name of the chart
*/}}
{{- define "fake-review.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" (include "fake-review.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Return the name of the service account to use
*/}}
{{- define "fake-review.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "fake-review.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

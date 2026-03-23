#!/usr/bin/env bash
# Supabase project config for ostack telemetry
# These are PUBLIC keys — safe to commit (like Firebase public config).
# RLS policies restrict what the anon/publishable key can do (INSERT only).

OSTACK_SUPABASE_URL="https://frugpmstpnojnhfyimgv.supabase.co"
OSTACK_SUPABASE_ANON_KEY="sb_publishable_tR4i6cyMIrYTE3s6OyHGHw_ppx2p6WK"

# Telemetry ingest endpoint (Data API)
OSTACK_TELEMETRY_ENDPOINT="${OSTACK_SUPABASE_URL}/rest/v1"

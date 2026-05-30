---
title: RTX 5090, Mac Studio, or DGX Spark? I tried all three.
type: source
video_id: iUSdS-6uwr4
url: https://www.youtube.com/watch?v=iUSdS-6uwr4
playlists: [1]
concepts: ['ai-personal-stack', 'local-ai-hardware']
updated: 2026-05-12
---

# RTX 5090, Mac Studio, or DGX Spark? I tried all three.

**Video:** [https://www.youtube.com/watch?v=iUSdS-6uwr4](https://www.youtube.com/watch?v=iUSdS-6uwr4) • **ID:** `iUSdS-6uwr4` • **Playlists:** P1

## Concepts covered

- [[concepts/ai-personal-stack]] — Durable architecture for personal AI involves a layered substrate
- [[concepts/local-ai-hardware]] — Hardware selection should prioritize workload type over peak benchmark scores

## Entries extracted

| ID | Category | Concept | TL;DR |
|----|----------|---------|-------|
| FWK-053 | FRAMEWORK | [[concepts/ai-personal-stack]] | Design a local AI stack around durable layers (hardware → runtime → model class → memory → apps) so models can swap in without rebuilding the substrate; the runtime layer is the most underrated component. |
| MSL-019 | MODEL_SELECTION | [[concepts/local-ai-hardware]] | Mac = unified memory + simplicity for private context work; CUDA/RTX = throughput for coding agents; DGX Spark = packaged Nvidia stack without building a tower; AMD Strix = hardware value but immature software. |
| TRD-057 | TREND | [[concepts/ai-personal-stack]] | The more capable an agent becomes, the more it reaches back toward local files, processes, permissions, and memory — making ownership of the personal compute layer strategically important again. |

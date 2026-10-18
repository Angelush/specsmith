---
title: 10.20 - agent computer
type: source
video_id: xUl-RD4l4i4
url: https://www.youtube.com/watch?v=xUl-RD4l4i4
playlists: [0]
concepts: [agent-harness-and-maintenance, multi-agent-system-design, local-ai-hardware]
updated: 2026-10-19
---

# 10.20 - agent computer

(Working title from the playlist; the video is about agents as "roommates" on your computer.) Nate argues you are no longer the only user of your machine: agents open browsers, start dev servers, write build caches and leave them behind, so a faster chip will not fix an unmanaged agent load. Four principles: (1) know where the work happens (the model may be in a data center, but servers, browsers and builds are local), (2) give every agent a stop sign and a known output location, (3) manage simultaneous demand by profiling and queueing heavy steps, and (4) run an ongoing maintenance agent. Only then have the hardware conversation: 24-32 GB RAM and 0.5-1 TB storage as a default, NPUs are no silver bullet, Mac is the least technical path (Nvidia/AMD = manual transmission), and keep the old machine as a Tailscale-managed agent computer.

## Concepts covered

- [[concepts/agent-harness-and-maintenance]] — agents as messy roommates: local resource leaks, audit-before-cleanup, stop signs, and a standing machine-health agent.
- [[concepts/multi-agent-system-design]] — manage simultaneous demand: profile load, ramp concurrency, serialize heavy local steps; CPU cores != agent count.
- [[concepts/local-ai-hardware]] — audit-first buying, Oct-2026 memory/storage sizing, NPU skepticism, repurpose old machines as agent computers.

## Notable quotes

- "You're not the only user of your computer anymore."
- "You can buy your way into more capacity, but you can't buy your way out of the problem."
- "All of the AI agents have been RLVR... trained to keep going, and so they'll just keep eating your local machine."

## Provenance

`data/transcripts/xUl-RD4l4i4.txt`

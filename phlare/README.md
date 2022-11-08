Phlare stores data pulled from /pprof endpoints

Phlare requirese its own agent currently. The agent is built into the Phlare binary with `--target=agent`. The Phlare agent will eventually be built into the Grafana Agent.

Right now the config file for the agent component and for Phlare are the same file because they are the same process. 
---
type: llm
weight: 2
---

PASS if the reply chooses the Quick route (or an equally minimal set of steps) AND its list of steps does not include red-team, simulate, optimize, or decompose-tasks AND it still includes capturing the reusable habit (capture-habit) at the end.
FAIL if it picks the Standard or Deep route, includes red-team/simulate/optimize/decompose-tasks as steps to run, or omits capture-habit.

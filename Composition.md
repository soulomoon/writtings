# Composition


For natural transformation, composition can come into two flavor, vertical composition and horizontal composition.

## Vertical Composition

1. $\mu : F \to G$
2. $\gamma: G \to H$

   ```mermaid
   graph LR;
       F0[$$F$$] -- $$\mu $$ --> F2["$$G$$"]
       F2 -- $$\gamma$$ --> F3["$$H$$"]
       F0 --> |$$\gamma \circ \mu$$| F3
   ```


## Horizontal Composition

* $\mu : F \Rightarrow G$
* $\gamma: H \Rightarrow K$
* $F, G: C \to D$
* $H, K: D \to E$

   ```mermaid
   graph LR;
       C --- F(($$F$$)) --> D
       C --- G(($$G$$)) --> D
       F --- ga(($$\gamma $$)) --> G
   ```

<!-- $$
\begin{tikzcd}
A \arrow[r, "f"] \arrow[d, "g"] & B \arrow[d, "h"] \\
C \arrow[r, "i"] & D
\end{tikzcd}
$$ -->

```graphviz
digraph finite_state_machine {
    // Define the nodes
    A [label="Node A"];
    B [label="Node B"];
    C [label="Node C"];
    D [label="Node D"];

    // Define the edges
    A -> B;
    B -> C;

    // Create an intermediary node to simulate an edge-to-edge connection
    edge1 [shape=point, width=0.01, label="", style=invis]; // Invisible node

    // Connect intermediary node to existing edges
    B -> edge1 [style=dotted]; // Connect B to intermediary node
    edge1 -> C [style=dotted]; // Connect intermediary node to C
    edge1 -> D [label="edge-to-edge"]; // Connect intermediary node to D to simulate edge-to-edge
}




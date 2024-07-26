# Whiskering

Whiskering is a notation is used in category theory to represent   horizontal composition of a 2-morphism with 1-morphism.

Take monad as an example, for the unit $\mu : I \to F$
we have left whiskering $F \mu$ and right whiskering $\mu F : F \to F^2$.
and right whiskering $F \mu : F \to F^2$.

   ```mermaid
   graph LR;
       F0[$$I$$] -- $$\mu $$ --> F11["$$F$$"]
       F12[$$F$$] -- $$\mu F$$ --> F22["$$F^2$$"]

       F0 --> |F| F12
       F11 --> |F| F22
   ```

       F1 -- $$F\mu$$ --> F22["$$F^2$$"]
       F21-- $$\eta$$ --> F2[$$F$$]
       F1 <-- $$id$$ --> F2
       F22-- $$\eta$$ --> F2


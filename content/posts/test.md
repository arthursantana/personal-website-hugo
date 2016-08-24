+++
date = "2016-08-24T01:06:27-03:00"
draft = "false"
description = "Test page"
title = "Testing Hugo!"

+++

# Biiiig header

## This post is going to be removed. Please comment below!

I'm testing. I don't remember how to write markdown. And I want mathjax to work.

Inline math here: `$ 2 < 3 $` (it works!)

Now for big math:
{{<math>}}
 \begin{bmatrix}
  1 & 0 & 0 \\
  0 & 1 & 0 \\
  0 & 0 & 1
 \end{bmatrix}
 \begin{bmatrix}
  1 & 0 & 0 \\
  0 & 1 & 0 \\
  0 & 0 & 1
 \end{bmatrix}
=
 \begin{bmatrix}
  1 & 0 & 0 \\
  0 & 1 & 0 \\
  0 & 0 & 1
 \end{bmatrix} \\
\\
\forall x \in X, \quad \exists y \leq \epsilon
{{</math>}}

### Ok, now some C code
{{<highlight c>}}
int x = 10;
{{</highlight>}}

### Then Go code
{{<highlight go>}}
int x := 10;
{{</highlight>}}

### Then Bash
{{<highlight bash>}}
ls | grep "nothing"
{{</highlight>}}

{{< mathjax >}}

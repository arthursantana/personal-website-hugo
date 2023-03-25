+++
date = "2016-08-24T08:27:43-03:00"
draft = "false"
description = "A very simple proof"
title = "Derivation of the Isometric Projection Formula"
tags = ["mathematics", "linear algebra"]

+++

This post was inspired by some discussion on [this cool 2008 article](http://bannalia.blogspot.com.br/2008/02/filmation-math.html) by Joaquín M. López Muñoz. Having just recently watched [Gilbert Strang's OCW Linear Algebra course](http://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/), I could not resist trying to prove the projection formula in Joaquín's article.

## Definition of the problem
If you don't know what an isometric projection is, please check the [Wikipedia article](https://en.wikipedia.org/wiki/Isometric_projection) for a nice introduction. Here I'll try to define it in terms of vectors.

First, consider the vector `$z$` equal to `$\begin{bmatrix}1&1&1\end{bmatrix}^T$`. Now let `$P$` be the plane normal to `$z$` that crosses the origin. We can choose vectors `$x$` and `$y$` such that they form an orthogonal basis for `$P$` and such that the [orthographic projection](https://en.wikipedia.org/wiki/Orthographic_projection) (what we usually understand by the projection of a vector) of `$k$` on `$P$` is proportional to `$y$`, with a positive multiplicative constant.

![Axes on place](/axes.png)

Please note:

1. the `$z$` vector is orthogonal to your monitor.
2. the `$k$` vector is *not* parallel to your monitor. It is pointing slightly to you, just as much as `$i$` and `$j$`. That's what isometry is about, if you rotated the axes 120 degrees around the line in the direction of `$z$`, you would have the same picture, just changing the names of the vectors.
3. I'm using a right-handed coordinate system. Using left-handed coordinates would switch the signs in our final projection matrix.

Now we have a perfect model of what we wanted: we have a camera looking at the origin, aligned vertically, equally close to each of the axes. If we were rendering a scene, we would translate the camera around, but we wouldn't change the vectors that determine the direction and rotation around `$z$`. We also have an orthogonal basis for the screen, which allows us to locate projected vectors correctly.

But there's a catch: if we choose just any arbitrary vectors for the basis, we might end up with the wrong image. If `$x$` and `$y$` have different norms, the image will be stretched vertically or horizontally, depending on whose norm is bigger. Because of this, we will choose vectors with the same norm. Specifically, we'll choose them with norm one, which will make calculations easier later on.

Also note that `$z$` is not normalized. We will normalize it too, so that we have a full orthonormal basis for `$\mathbb{R^3}$`.

To choose our vectors, let's consider the unit vectors in each direction of the canonical basis,
{{<math>}}
\hat{i} =
\begin{bmatrix}
1\\ 0\\ 0
\end{bmatrix},
\hat{j} =
\begin{bmatrix}
0\\ 1\\ 0
\end{bmatrix},
\hat{k} =
\begin{bmatrix}
0\\ 0\\ 1
\end{bmatrix}
{{</math>}}

Now we define tree vectors `$a = \hat{k}-\hat{i}$`, `$b = \hat{k}-\hat{j}$` and `$c = \hat{j}-\hat{i}$`, all in `$P$`, as in the image below:

![Choosing our basis](/unitvectors.png)

We can then set `$\hat{x}$` to be the normalized `$c$`, and `$\hat{y}$` to be the normalized result of `$a + b$`. We use hats from now on to make it explicit that these vectors have norm equal to one (I'll keep the ambiguity in this phrase because it sounds funny).

Thus we have (calculations omitted, just divide by the norm to make the vectors into unit vectors):

{{<math>}}
\hat{x} =
\begin{bmatrix}
-\sqrt{2}/2\\ \sqrt{2}/2\\ 0
\end{bmatrix},
\hat{y} =
\begin{bmatrix}
-\sqrt{6}/6\\ -\sqrt{6}/6\\ \sqrt{6}/3
\end{bmatrix},
\hat{z} =
\begin{bmatrix}
\sqrt{3}/3\\ \sqrt{3}/3\\ \sqrt{3}/3
\end{bmatrix}
{{</math>}}

You can check that `$x$`, `$y$` and `$z$` are all orthogonal to each other (inner products are equal to 0) and have norm one.

Now that we have an orthonormal basis aligned to the screen, we can define the problem easily:

> Given a vector `$v$` expressed in the canonical basis, we want it's projection on `$P$`, expressed in terms of `$x$`, `$y$` and `$z$`.

Actually, the `$z$` part will always be zero, since `$z$` is the component orthogonal to the plane. Projecting a vector on `$P$` is equivalent to zeroing this component, and that's how we are going to do it.

## Change of basis

Now we need to convert `$v$` into terms of our new basis. First, notice that the matrix
{{<math>}}
M=
\left[
\begin{array}{c|c|c}
x & y & z
\end{array}
\right]
=
\begin{bmatrix}
-\sqrt{2}/2& -\sqrt{6}/6& \sqrt{3}/3\\
\sqrt{2}/2& -\sqrt{6}/6& \sqrt{3}/3\\
0& \sqrt{6}/3& \sqrt{3}/3\\
\end{bmatrix}
{{</math>}}
is the matrix that transforms from the description in terms of the new basis into the canonical description. What we need is its inverse, `$M^{-1}$`. Fortunately, we have constructed M in such a way that it is orthogonal, and therefore it has the key property:
{{<math>}}
M^TM=I
{{</math>}}
That is, `$M^{-1} = M^T$`. We only need to multiply `$M^Tv$` to find `$v$` in our new basis. Also, because we don't care about the `$z$` component, we can simply select the first two rows of `$M^{-1}$`. The projection is automatic, because it is orthographic. Here is our transformation matrix:

{{<math>}}
\begin{bmatrix}
-\sqrt{2}/2& \sqrt{2}/2& 0\\
-\sqrt{6}/6& -\sqrt{6}/6& \sqrt{6}/3
\end{bmatrix}
{{</math>}}

We can simplify this by scaling down the whole image (dividing) by `$\sqrt{6}/6$` to get our final transformation matrix:
{{<math>}}
\begin{bmatrix}
-\sqrt{3}& \sqrt{3}& 0\\
-1& -1& 2
\end{bmatrix}
{{</math>}}

Notice that this is the same transformation in Joaquín's original post, except for a scaling constant of 2. Also notice that it's the same matrix given in Wikipedia's proof using rotation matrices (I have no idea how they came up with that crazy angle of 35.264º. If you know, please tell me).

## Quick note on projection matrices
The first time I tried to prove this result, I actually calculated the projection matrix `$R = A(A^TA)^{-1}A^T$`, that produces the projected vector in terms of the original canonical basis. After that, I found that I had to convert to the screen basis, using the matrix `$M^{-1}$` that we found above. When I tried to compose the transformations, something remarkable came up: `$R*M^{-1}$` is *equal* to `$M^{-1}$`, only with last row zeroed! This is exactly what we should expect, and is why we don't need to do the projection in 3 dimensions at all. By changing to a basis which has a component orthogonal to the plane, we can simply discard this component.

## Conclusion
This was a nice application of basic linear algebra. The proof is really simple, once you find how to select the correct vectors for the basis.

In the future, I hope to write about GPU z-buffers and how to render sprites in an isometric game without using a topological sort. Before that, though, I have to make it work.

Please comment below if you have anything to add.

{{< mathjax >}}

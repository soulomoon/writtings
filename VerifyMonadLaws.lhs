\documentstyle{article}

\begin{document}

\chapter{Introduction}

This is a trivial program that prints the first 20 factorials.

\begin{code}
{-@ LIQUID "--prune-unsorted" @-}
import Prelude hiding (Identity)
type (~>) f g = forall a. f a -> g a
data Compose f g a = Compose { getCompose :: f (g a) }
toCompose :: f (g a) -> Compose f g a
toCompose = Compose
fromCompose :: Compose f g a -> f (g a)
fromCompose = getCompose
wrapCompose f = toCompose . f . fromCompose
leftWhisker :: (Functor f) => (g ~> h) -> (Compose f g ~> Compose f h)
leftWhisker eta = wrapCompose (fmap eta)
-- since we are in the same category, we can use eta directly
rightWhisker :: (Functor f) => (g ~> h) -> (Compose g f ~> Compose h f )
rightWhisker eta = wrapCompose eta
class ISO f g where iso :: f ~> g
instance (Functor f) => ISO (Compose f Identity) f where iso = fmap runIdentity . fromCompose
instance (Functor f) => ISO f (Compose f Identity) where iso = toCompose . fmap Identity
instance ISO (Compose Identity f) f where iso = runIdentity . fromCompose
instance ISO f (Compose Identity f) where iso = toCompose . Identity
instance ISO f f where iso = id
data Identity a = Identity a
runIdentity :: Identity a -> a
runIdentity (Identity a) = a
class MonadClass m where
  unit :: Identity ~> m
  join :: Compose m m ~> m
instance MonadClass [] where
  unit (Identity a) = [a]
  join :: Compose [] [] ~> []
  join = concat . fromCompose
{-@ roundTrips :: x:[Int] -> { r:Bool | r == True} @-}
roundTrips :: [Int] -> Bool
roundTrips x = roundTrip1 x == roundTrip2 x
-- specifications go between special comments `{-@ ... @-}`
{-@ elemAt :: xs:[a] -> { i:Int | 0 <= i && i < len xs } -> a @-}
elemAt :: [a] -> Int -> a
elemAt (x :  _) 0 = x
elemAt (_ : xs) i = elemAt xs (i-1)
roundTrip1 :: forall a. [a] -> [a]
roundTrip1 = join . rightWhisker unit . iso
roundTrip2 :: forall a. [a] -> [a]
roundTrip2 = join . leftWhisker unit . iso

main = undefined
\end{code}
\end{document}
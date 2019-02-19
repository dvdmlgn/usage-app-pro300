import '../models/product.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';

var products = <Product>[];
var consumables = <Consumable>[];
var groceries = <Grocery>[];
var posts = fillPosts();

var i1 = new Consumable(productId: "1", name: 'Apple', quantity: 2);
var i2 = new Consumable(productId: "2", name: 'Banana', quantity: 3);
var i3 = new Consumable(productId: "3", name: 'Carrot', quantity: 5);
var i4 = new Consumable(productId: "4", name: 'Date', quantity: 7);
var i5 = new Consumable(productId: "5", name: 'Grapes', quantity: 11);
var i6 = new Consumable(productId: "6", name: 'Lemon', quantity: 13);

var p1 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
  );

var p2 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p3 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p4 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p5 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p6 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p7 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p8 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p9 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

var p10 = new Post
  (
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id magna tortor. Donec tincidunt neque mi, quis dignissim dolor cursus et. Etiam a arcu sed nisl tincidunt aliquam a nec enim. Phasellus mattis ante quis ligula lobortis, accumsan rhoncus urna elementum. Sed dictum nec lacus quis hendrerit. Quisque ut est elementum, dapibus lacus sit amet, volutpat erat. Proin augue mauris, efficitur vel mattis finibus, iaculis at purus. Quisque felis urna, elementum ac lorem vitae, rutrum lacinia urna. Pellentesque a erat id sapien imperdiet pretium. Ut accumsan augue vitae turpis sodales aliquam. Morbi id ante ligula. Nunc bibendum finibus mi, eu rutrum turpis rutrum et. Sed eu posuere eros. Praesent et viverra enim, vel molestie orci. Nulla vitae risus at risus pellentesque fringilla vel egestas mi.",
    tags: ["Tag", "Tag", "Tag"]
);

void fillList() {
  consumables.add(i1);
  consumables.add(i2);
  consumables.add(i3);
  consumables.add(i4);
  consumables.add(i5);
  consumables.add(i6);
}

List<Post> fillPosts(){
  List<Post> samplePosts = new List<Post>();

  samplePosts.add(p1);
  samplePosts.add(p2);
  samplePosts.add(p3);
  samplePosts.add(p4);
  samplePosts.add(p5);
  samplePosts.add(p6);
  samplePosts.add(p7);
  samplePosts.add(p8);
  samplePosts.add(p9);
  samplePosts.add(p10);

  return samplePosts;
}

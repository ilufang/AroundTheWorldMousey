PImage photo;

class city
{
  public int x, y;
  public boolean visited;
  city(int x0, int y0)
  {
    x=x0;
    y=y0;
    visited = false;
  }
  city()
  {
    x=0;
    y=0;
    visited = false;
  }
  void draw()
  {
    noStroke();
    fill(#ff0000);
    ellipse(x, y, 5, 5);
  }
  int distance(city dest)
  {
    return (int)sqrt((x-dest.x)*(x-dest.x)+(y-dest.y)*(y-dest.y));
  }
}

city[] locations = {
  new city(159, 245), 
  new city(267, 223), 
  new city(278, 281), 
  new city(279, 291), 
  new city(267, 221), 
  new city(297, 253), 
  new city(305, 233), 
  new city(901, 268), 
  new city(314, 224), 
  new city(541, 192), 
  new city(890, 294), 
  new city(850, 338),
  };

int[] removeObjectAtIndex(int[] arr, int index)
  {
    int t = 0;
    int[] result = new int[arr.length-1];
    for (int i = 0; i != arr.length; i++)
    {
      if (i != index)
      {
        result[t] = arr[i];
        t++;
      }
    }
    return result;
  }

int lengthFromPoint(int begin, int[] path)
{
  int dist = locations[begin].distance(locations[path[0]]);
  for (int i = 0; i < path.length-1; i++)
  {
    dist += locations[path[i]].distance(locations[path[i+1]]);
  }
  return dist;
}

int[] iterate_path(int begin, int[] candidate)
{
  // Recursion to iterate thru all points
  if (candidate.length == 1)
  {
    return candidate;
  }
  int[] result = new int[candidate.length];
  int minDist = 2147483647;
  for (int i = 0; i != candidate.length; i++)
  {
    int[] result1 = iterate_path(candidate[i], removeObjectAtIndex(candidate, i));
    // Append original point
    int[] result2 = new int [candidate.length];
    result2[0] = candidate[i];
    for (int j = 0; j != candidate.length-1; j++)
    {
      result2[j+1] = result1[j];
    }
    // result2 is the complete route. Calculate length
    int dist1 = lengthFromPoint(begin, result2);
    if (dist1 < minDist)
    {
      minDist = dist1;
      result = result2;
    }
  }
//  printarr(result);
  return result;
}

int[] result = new int[12];

void generate_path()
{
  int[] candidate = {
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
  };
  result = iterate_path(0, candidate);
}

void setup() {
  size(1100, 714);
  photo = loadImage("pic.jpg");
  generate_path();
}

void draw() {
    image(photo, 0, 0);
    for (int i = 0; i != 12; i++)
    {
      locations[i].draw();
    }
    stroke(#000000);
    line (locations[0].x, locations[0].y, locations[result[0]].x, locations[result[0]].y);
    for (int i = 0; i != result.length-1; i++)
    {
      line(locations[result[i]].x, locations[result[i]].y, locations[result[i+1]].x, locations[result[i+1]].y);
    }
}


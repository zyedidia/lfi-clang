#include <cassert>
#include <queue>
#include <iostream>

int main() {
    std::priority_queue<int> q;
    q.emplace(2);
    q.emplace(1);
    q.emplace(3);
    assert(q.top() == 3);
    q.pop();
    assert(q.top() == 2);
    q.pop();
    assert(q.top() == 1);
    q.pop();
    std::cout << "done!" << std::endl;
}

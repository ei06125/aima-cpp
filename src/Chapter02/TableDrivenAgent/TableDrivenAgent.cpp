// Copyright ei06125. All Rights Reserved.

#include <unordered_map>
#include <vector>

template <class Action, class Percept> class TableDrivenAgent {
  public:
	Action operator()(Percept newPercept) {
		mPercepts.push_back(std::move(newPercept));
	}

  private:
	std::vector<Percept> mPercepts{};
	static std::unordered_map<std::vector<Percept>, Action> mActionsTable{};
};

int main() { return 0; }

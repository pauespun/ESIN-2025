#include "ubicacio.hpp"

ubicacio::ubicacio(int i, int j, int k) {
    this->i = i;
    this->j = j;
    this->k = k;
}

ubicacio::ubicacio(const ubicacio& u) {
    this->i = u.i;
    this->j = u.j;
    this->k = u.k;
}

ubicacio& ubicacio::operator=(const ubicacio& u) {
    this->i = u.i;
    this->j = u.j;
    this->k = u.k;
    return *this;
}

ubicacio::~ubicacio() noexcept {}

int ubicacio::filera() const noexcept {
    return this->i;
}

int ubicacio::placa() const noexcept {
    return this->j;
}

int ubicacio::pis() const noexcept {
    return this->k;
}

bool ubicacio::operator==(const ubicacio &u) const noexcept {
    return this->i == u.i && this->j == u.j && this->k == u.k;
}

bool ubicacio::operator!=(const ubicacio &u) const noexcept {
    return !(*this == u);
}

bool ubicacio::operator<(const ubicacio &u) const noexcept {
    if (this->i == u.i) {
        if (this->j == u.j) {
            return this->k < u.k;
        }
        return this->j < u.j;
    }
    return this->j < u.j;
}

bool ubicacio::operator>(const ubicacio &u) const noexcept {
    if (this->i == u.i) {
        if (this->j == u.j) {
            return this->k > u.k;
        }
        return this->j > u.j;
    }
    return this->j > u.j;
}

bool ubicacio::operator<=(const ubicacio &u) const noexcept {
    return !(*this > u);
}

bool ubicacio::operator>=(const ubicacio &u) const noexcept {
    return !(*this < u);
}